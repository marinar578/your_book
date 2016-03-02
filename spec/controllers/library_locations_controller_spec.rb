require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LibraryLocationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # LibraryLocation. As you add validations to LibraryLocation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LibraryLocationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all library_locations as @library_locations" do
      library_location = LibraryLocation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:library_locations)).to eq([library_location])
    end
  end

  describe "GET #show" do
    it "assigns the requested library_location as @library_location" do
      library_location = LibraryLocation.create! valid_attributes
      get :show, {:id => library_location.to_param}, valid_session
      expect(assigns(:library_location)).to eq(library_location)
    end
  end

  describe "GET #new" do
    it "assigns a new library_location as @library_location" do
      get :new, {}, valid_session
      expect(assigns(:library_location)).to be_a_new(LibraryLocation)
    end
  end

  describe "GET #edit" do
    it "assigns the requested library_location as @library_location" do
      library_location = LibraryLocation.create! valid_attributes
      get :edit, {:id => library_location.to_param}, valid_session
      expect(assigns(:library_location)).to eq(library_location)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LibraryLocation" do
        expect {
          post :create, {:library_location => valid_attributes}, valid_session
        }.to change(LibraryLocation, :count).by(1)
      end

      it "assigns a newly created library_location as @library_location" do
        post :create, {:library_location => valid_attributes}, valid_session
        expect(assigns(:library_location)).to be_a(LibraryLocation)
        expect(assigns(:library_location)).to be_persisted
      end

      it "redirects to the created library_location" do
        post :create, {:library_location => valid_attributes}, valid_session
        expect(response).to redirect_to(LibraryLocation.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved library_location as @library_location" do
        post :create, {:library_location => invalid_attributes}, valid_session
        expect(assigns(:library_location)).to be_a_new(LibraryLocation)
      end

      it "re-renders the 'new' template" do
        post :create, {:library_location => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested library_location" do
        library_location = LibraryLocation.create! valid_attributes
        put :update, {:id => library_location.to_param, :library_location => new_attributes}, valid_session
        library_location.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested library_location as @library_location" do
        library_location = LibraryLocation.create! valid_attributes
        put :update, {:id => library_location.to_param, :library_location => valid_attributes}, valid_session
        expect(assigns(:library_location)).to eq(library_location)
      end

      it "redirects to the library_location" do
        library_location = LibraryLocation.create! valid_attributes
        put :update, {:id => library_location.to_param, :library_location => valid_attributes}, valid_session
        expect(response).to redirect_to(library_location)
      end
    end

    context "with invalid params" do
      it "assigns the library_location as @library_location" do
        library_location = LibraryLocation.create! valid_attributes
        put :update, {:id => library_location.to_param, :library_location => invalid_attributes}, valid_session
        expect(assigns(:library_location)).to eq(library_location)
      end

      it "re-renders the 'edit' template" do
        library_location = LibraryLocation.create! valid_attributes
        put :update, {:id => library_location.to_param, :library_location => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested library_location" do
      library_location = LibraryLocation.create! valid_attributes
      expect {
        delete :destroy, {:id => library_location.to_param}, valid_session
      }.to change(LibraryLocation, :count).by(-1)
    end

    it "redirects to the library_locations list" do
      library_location = LibraryLocation.create! valid_attributes
      delete :destroy, {:id => library_location.to_param}, valid_session
      expect(response).to redirect_to(library_locations_url)
    end
  end

end
