require 'pp'

require 'dotenv/load'
require 'google/cloud/vision'

project_id = ENV['GCP_PROJECT_ID']
filepath = './input/sample.jpg'

vision = Google::Cloud::Vision.new(
  project: project_id,
  credentials: './gcp-credential.json'
)
image = vision.image(filepath)
image.context.languages = %w[ja en]
text = image.text

File.open('./output/sample.txt', 'w+') do |f|
  PP.pp(text.to_h, f)
end
