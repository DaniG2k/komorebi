require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#set_html_lang" do
    it 'defaults to english' do
    end
  end
  describe '#copyright_date' do
    
    before do
      Timecop.freeze(Time.local(2016))
    end
    after do
      Timecop.return
    end

    it 'returns 2016 by default' do
      expect(helper.copyright_date).to eq('2016')
    end

    it 'returns a date range if the year is > 2016' do
      Timecop.freeze(Time.now + 1.year) do
        expect(helper.copyright_date).to eq('2016-2017')
      end
    end
  end
end
