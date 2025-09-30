cat > config/initializers/mini_magick.rb << 'EOF'
require "mini_magick"

# WSL 上のホームディレクトリに一時ディレクトリを作成
tmp_path = File.join(ENV['HOME'], "mini_magick_tmp")
Dir.mkdir(tmp_path) unless Dir.exist?(tmp_path)

MiniMagick.configure do |config|
  config.tmpdir = tmp_path
end

ENV['TMPDIR'] = tmp_path
ENV['TEMP']   = tmp_path
ENV['TMP']    = tmp_path
EOF
