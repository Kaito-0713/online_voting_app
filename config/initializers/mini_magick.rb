require "mini_magick"

# Windows の書き込み可能なディレクトリを指定
tmp_path = "C:/Users/kkait/mini_magick_tmp"
Dir.mkdir(tmp_path) unless Dir.exist?(tmp_path)

MiniMagick.configure do |config|
  config.tmpdir = tmp_path
end

# Windows の環境変数も上書き
ENV['TMPDIR'] = tmp_path
ENV['TEMP']   = tmp_path
ENV['TMP']    = tmp_path
