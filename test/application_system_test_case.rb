require "test_helper"
require "webdrivers"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400] do |options|
    options.binary = "C:/Program Files/Google/Chrome/Application/chrome.exe"
  end
end
