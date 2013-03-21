require 'spec_helper'

describe BookingStepController do

  describe "GET 'select_seat'" do
    it "returns http success" do
      get 'select_seat'
      response.should be_success
    end
  end

  describe "GET 'comfirm'" do
    it "returns http success" do
      get 'comfirm'
      response.should be_success
    end
  end

  describe "GET 'summary'" do
    it "returns http success" do
      get 'summary'
      response.should be_success
    end
  end

end
