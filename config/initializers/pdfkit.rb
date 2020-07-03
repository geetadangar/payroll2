# config/initializers/pdfkit.rb
# Rails::Initializer.run do |config|
  # config.middleware.use PDFKit::Middleware
  #comment before old code #PDFKit.configure do |config|
    # config.wkhtmltopdf = '/wkhtmltopdf'
  # config.default_options = {
    # :page_size => 'Legal',
    # :print_media_type => true
  # }
    # config.default_options[:quite] = false
  # Use only if your external hostname is unavailable on the server.
    # config.root_url = "http://localhost:3000"
    # config.verbose = false
  # comment before old code#end
# end
# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  # config.wkhtmltopdf = '/path/to/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost"
  config.verbose = false
end