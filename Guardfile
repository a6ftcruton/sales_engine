guard :minitest do
  watch(/^lib\/(.+)\.rb/) { |captures| "test/#{captures[1]}_test.rb"}
  watch(/^lib\/repo\/(.+)\.rb/) { |captures| "test/#{captures[1]}_test.rb"}
  watch(/^test\/.+\.rb/)
end
