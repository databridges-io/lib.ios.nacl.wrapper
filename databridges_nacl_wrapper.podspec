#
#        DataBridges Swift NaCl wrapper for databridges library.
#        https:#www.databridges.io/ 
#
#        Copyright 2022 Optomate Technologies Private Limited.
#        
#        Permission is hereby granted, free of charge, to any person obtaining
#        a copy of this software and associated documentation files (the
#        "Software"), to deal in the Software without restriction, including
#        without limitation the rights to use, copy, modify, merge, publish,
#        distribute, sublicense, and/or sell copies of the Software, and to
#        permit persons to whom the Software is furnished to do so, subject to
#        the following conditions:
#        
#        The above copyright notice and this permission notice shall be
#        included in all copies or substantial portions of the Software.
#        
#        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#        LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#        OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#        WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
#

#
# Be sure to run `pod lib lint dbridges.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DatabridgesNaCLWrapper'
  s.version          = '1.0.1'
  s.summary          = 'DataBridges Swift NaCl wrapper for databridges library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DataBridges makes it easy for connected devices and applications to communicate with each other in realtime in an efficient, fast, reliable and trust-safe manner. Databridges Swift client library (targeting iOS) allows you to easily add realtime capabilities to your applications in record time.
                       DESC

  s.homepage         = 'https://github.com/databridges-io/lib.ios.nacl.wrapper' 
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { "Optomate Technologies Private Limited." => "tech@optomate.io" }
  s.source           = { git: "https://github.com/databridges-io/lib.ios.nacl.wrapper.git", tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/databridges-io

  s.ios.deployment_target = '9.0'

  s.source_files = 'databridges_nacl_wrapper/Classes/**/*'
    
end
