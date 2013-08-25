require 'spec_helper'

describe MessagesController do

  describe "GET #index" do
    it "populates an array of messages as @messages" do
      message = FactoryGirl.create(:message)
      get :index
      assigns(:messages).should eq([message])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested message as @message" do
      message = FactoryGirl.create(:message)
      get :show, id: message
      assigns(:message).should eq(message)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:message)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Message to @message" do
      post :new, message: FactoryGirl.attributes_for(:message)
      assigns(:message).should be_a(Message)
    end
    it "renders the :new_sms template" do
      get :new, id: FactoryGirl.attributes_for(:message)
      response.should render_template :new
    end
  end

  describe "POST #create" do 
    context "with valid attributes" do
      it "creates a new message" do
        expect{
          post :create, message: FactoryGirl.attributes_for(:message)
        }.to change(Message,:count).by(1)
      end

      it "returns the newly created message as @message" do
          post :create, message: FactoryGirl.attributes_for(:message)
          assigns(:message).should be_a(Message)
          assigns(:message).should be_persisted
      end

      it "redirects to the new message" do
        post :create, message: FactoryGirl.attributes_for(:message)
        response.should redirect_to Message.last
      end
    end

    context "with invalid attributes" do 
      it "does not save the new message" do
        expect{
          post :create, message: FactoryGirl.attributes_for(:invalid_message)
        }.to_not change(Message,:count)
      end

      it "returns to new" do
        post :create, message: FactoryGirl.attributes_for(:invalid_message)
        response.should render_template :new
      end
    end 
  end

  describe "DELETE #destroy" do
    before :each do
      @message = FactoryGirl.create(:message)
    end
     
    it "destroys the requested message" do
      expect {
        delete :destroy, id: @message
      }.to change(Message,:count).by(-1)
    end

    it "redirects to the messages list" do
      delete :destroy, id: @message
      response.should redirect_to(messages_url)
    end
  end
end
