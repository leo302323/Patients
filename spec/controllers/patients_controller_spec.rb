require 'spec_helper'

describe PatientsController, :type => :controller do
  describe "GET index" do
    let(:patient) { create(:patient) }
    it "assigns @patients" do
      get :index
      expect(assigns(:patients)).to eq([patient])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    let(:patient) { create(:patient) }
    it "assigns  @patient" do
      get :show, id: patient
      expect(assigns(:patient)).to eq patient
    end

    it "renders the :show template" do
      get :show, id: patient
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Patient to @patient" do
      get :new
      expect(assigns(:patient)).to be_a_new(Patient)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do
    let(:patient) { create(:patient) }
    it "assigns the requested patient to @patient" do
      get :edit, id: patient
      expect(assigns(:patient)).to eq patient
    end

    it "renders the :edit template" do
      get :edit, id: patient
      expect(response).to render_template :edit
    end
  end





end