Gem::Specification.new 'responds_to_parent', '1.0.20130516'  do |s|
  s.authors     = ["Mark Catley"]
  s.homepage    = 'https://github.com/markcatley/responds_to_parent'
  s.summary     = "[Rails] Adds 'responds_to_parent' to your controller to" +
                  'respond to the parent document of your page.'            +
                  'Make Ajaxy file uploads by posting the form to a hidden' +
                  'iframe, and respond with RJS to the parent window.'
  s.files = `git ls-files lib`.split("\n")
  s.license = "MIT"
end
