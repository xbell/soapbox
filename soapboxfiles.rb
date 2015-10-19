class SoapboxFiles
  # putting our bubbles in order by least recent to most recent
  def self.sort(all_bubbles)
    all_bubbles.sort_by! {|bubble_file| File.mtime(bubble_file)}
  end
  # reads all files in Soapbox
  def self.read
    Dir.glob("*")
  end
end
