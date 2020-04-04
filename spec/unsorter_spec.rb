# frozen_string_literal: true

RSpec.describe Unshorter do
  before(:all) do
    @unshorter = described_class.new
  end

  it "should unshoted urls" do
    services = %w[
      https://bit.ly/34alh0B
      http://0rz.tw/8UMhS
      https://2.gp/a714W
      http://alturl.com/q2vwx
      http://chilp.it/9597099
      https://clck.ru/Mp4Ut
      https://cutt.us/wm2VZ
      https://is.gd/GjXBvB
      http://merky.de/18bnuf
      https://soo.gd/jha0
      https://tiny.pl/7hl3c
      https://tinyurl.com/rnm9238
    ]
    threads = []
    services.each do |service|
      threads << Thread.new { @unshorter.call(service) == "https://github.com/heckfy/unshorter" }
    end
    threads.each(&:join)
    expect(threads.all?).to eq(true)
  end
end
