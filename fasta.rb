require "formula"

class Fasta < Formula
  homepage "http://faculty.virginia.edu/wrpearson/fasta/"
  #doi "10.1016/0076-6879(90)83007-V"
  #tag "bioinformatics"

  url "http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-36.3.7.tar.gz"
  sha1 "184acbac526ebdb3cad0009d87bd2a68b4756a03"

  def install
    mkdir "bin"
    cd "src" do
      system "make", "-f",
        if OS.mac?
          "../make/Makefile.os_x86_64"
        elsif OS.linux?
          "../make/Makefile.linux64_sse2"
        else
          raise "Unknown operating system"
        end
    end
    bin.install Dir["bin/*"]
    doc.install Dir["doc/*"]
  end

  test do
    system "#{bin}/fasta36"
  end
end
