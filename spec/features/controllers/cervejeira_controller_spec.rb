require 'rails_helper'

RSpec.describe CervejeiraController, type: :controller do
  render_views

  describe "#index" do
    context "when using valid temperatura" do
      before(:each) do
        VCR.use_cassette('get_beer_valid_temperature') do
          temperatura = '-2'
          visit '/'
          fill_in 'temperatura', with: temperatura
          click_button('Servir Cerveja')
        end
      end

      it "redirects to the right url" do
        expect(current_path).to eq('/cervejeira/cerveja')
      end

      it "shows the beer style" do
        expect(find('.card-body h2')).to have_content('Dunkel')
      end

      it "shows the link to go back to home" do
        expect(find('a')).to have_content('Voltar')
      end
    end

    context "when using invalid temperatura" do
      before(:each) do
        temperatura = 'invalid_temperature'

        VCR.use_cassette('get_beer_invalid_temperature') do
          visit '/'
          fill_in 'temperatura', with: temperatura
          click_button('Servir Cerveja')
        end

      end

      it "redirects to the right url" do
        expect(current_path).to eq('/cervejeira/cerveja')
      end

      it "shows error message to the user" do
        expect(find('.card-body h3')).to have_content('Oh não! Parece que algo deu errado e não conseguimos achar sua cerveja =(')
      end

      it "shows the link to go back to home" do
        expect(find('a')).to have_content('Voltar')
      end
    end
  end

  describe "#cerveja" do
    context "when using valid temperatura" do
      before(:each) do
        VCR.use_cassette('beer_valid_temperature') do
          temperatura = '-2'
          visit "/cervejeira/cerveja?temperatura=#{temperatura}"
        end
      end

      it "shows the beer style" do
        expect(find('.card-body h2')).to have_content('Dunkel')
      end

      it "the link to go back to home works fine" do
        click_link 'a'
        expect(current_path).to eq('/')
      end
    end

    context "when using invalid temperatura" do
      before(:each) do
        VCR.use_cassette('beer_invalid_temperature') do
          temperatura = 'invalid_temperature'
          visit "/cervejeira/cerveja?temperatura=#{temperatura}"
        end
      end

      it "shows error message to the user" do
        expect(find('.card-body h3')).to have_content('Oh não! Parece que algo deu errado e não conseguimos achar sua cerveja =(')
      end

      it "the link to go back to home works fine" do
        click_link 'a'
        expect(current_path).to eq('/')
      end
    end
  end
end
