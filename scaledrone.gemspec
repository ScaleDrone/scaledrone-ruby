Gem::Specification.new do |spec|
  spec.name          = "scaledrone"
  spec.version       = "0.1"
  spec.date          = Time.now
  spec.authors       = ["Serge Herkül"]
  spec.email         = ["info@scaledrone.com"]
  spec.summary       = 'Official ScaleDrone Ruby pushing library'
  spec.description   = 'Push messaging that makes sense'
  spec.homepage      = 'https://www.scaledrone.com/'
  spec.license       = 'MIT'

  spec.files         = ['lib/scaledrone.rb']
  #spec.files        += Dir.glob('lib/scaledrone/*.rb')

  spec.add_dependency 'httparty', '~> 0.13'
end
