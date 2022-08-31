#I could separate this task in many interactors by functionality, but to keep it simply i put all here.
class SaveFromFile
  include Interactor
  require 'csv'

  def call
    
    context.fail!(message: "Missing param base_64_file") unless context.base_64_file.present?
    decode_base64_content = Base64.decode64(context.base_64_file)
    
    #I parse the file to store the data in every table/model.
    csv_text = decode_base64_content
    context.csv = CSV.parse(csv_text, :headers => true)

    #[0]Reference, [1]Order Date, [2]Vendor ID, [3]Vendor Name, [4]Product ID, [5]Product Name, [6]Buyer Email, [7]Buyer Name
    context.success_with_errors = []
    context.csv.each_with_index do |row, i|
      if row[0-7].blank?
        #i+2 because here it starts from 0 and because of the headers
        context.success_with_errors << "Line #{i+2} cannot be save, missing field" 
      else
        context.product = Product.find_or_create_by(code: row[4], name: row[5])
        context.vendor = User.find_or_create_by(code: row[2], name: row[3])
        context.buyer = User.find_or_create_by(email: row[6], name: row[7])

        #Check if the sale is not in the DB (I suppose the sales ref code is uniq)
        unless Sale.find_by(code: row[0]).present?
          context.sale = Sale.new(code: row[0], order_date: row[1], vendor: context.vendor, buyer: context.buyer)
        
          #To improve: By now, every sale has one product, but could group all products in the same sale 
          #i.e: all sales with the same reference number
          context.sale.products << context.product
          context.fail!(message: context.sale.errors) unless context.sale.save
        else
          context.success_with_errors << "Line #{i+2} (ref: #{row[0]}) sale already exists" 
        end
      end
    end
    #I chose to save it both for base64(TEXT) and attachment just for testing purposes, one it's enough.   
    context.attachment = Attachment.new(
      base_64_file: decode_base64_content,
      csv_file: {
        io: StringIO.new(decode_base64_content),
        content_type: "text/csv",
        filename: "uploaded_file.csv"
      })
    context.fail!(message: context.attachment.errors) unless context.attachment.save
    
    #If no validation fails, I return the list of registries that didn't been saved.
    context.success_with_errors
  rescue => e
    Rails.logger.error e
    context.fail!(message: e.message)

  end
end