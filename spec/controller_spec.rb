require_relative "spec_helper"

describe "Controller" do

  describe "Home Page" do

    it "should be ok" do
      get "/"
      expect(last_response).to be_ok
    end
  end


    it "renders a list of Surveys" do
      Survey.create(title: "My Article")
      get '/users/:user_id/surveys'
      expect(last_response.body).to include("My Survey")
    end


  describe "GET /survey/:id" do
    describe "if the survey exists" do
      it "renders a successful status" do

        @survey = Survey.create(title: "Some Survey")

        get "/survey/#{@survey.id}"

        expect(last_response.status).to eq(200)
      end
    end
  end

  describe "POST /surveys" do
    it "deletes a survey" do
      Survey.delete_all
      expect {
        post "/surveys", title: "Delete!."
      }.to change { Survey.count }
    end
  end



end
