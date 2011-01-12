require 'spec_helper'

describe LocationsController do

  let(:location) { mock_model(Location).as_null_object }

  describe 'GET index' do
    it 'assigns all locations as @locations' do
      Location.stub(:all) { [location] }
      get :index
      assigns(:locations).should eq([location])
    end
  end

  context 'when the user is an organizer' do
    before do
      sign_in Factory(:organizer)
    end

    describe 'GET show' do
      it 'assigns the requested location as @location' do
        Location.stub(:find).with('37') { location }
        get :show, :id => '37'
        assigns(:location).should be(location)
      end
    end

    describe 'GET new' do
      it 'assigns a new location as @location' do
        Location.stub(:new).and_return(location)
        get :new
        assigns(:location).should be(location)
      end
    end

    describe 'POST create' do
      context 'when the location saves successfully' do
        before do
          location.stub(:save).and_return(true)
        end

        it 'sets a flash[:notice] message' do
          post :create
          flash[:notice].should eq('The location was saved successfully.')
        end

        it 'redirects to the Locations index' do
          post :create
          response.should redirect_to(:action => 'index')
        end
      end

      context 'when the location fails to save' do
        before do
          location.stub(:save).and_return(false)
        end

        it 'assigns @location' do
          Location.should_receive(:new).and_return(location)
          post :create
          assigns[:location].should eq(location)
        end

        it 'renders the new template' do
          Location.should_receive(:new).and_return(location)
          post :create
          response.should render_template('new')
        end
      end
    end

    describe 'GET edit' do
      it 'assigns the requested location as @location' do
        Location.stub(:find).with('37') { location }
        get :edit, :id => '37'
        assigns(:location).should be(location)
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        before do
          location.stub(:update_attributes).and_return(true)
        end

        it 'updates the requested location' do
          Location.should_receive(:find).with('37') { location }
          location.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => '37', :location => {'these' => 'params'}
        end

        it 'assigns the requested location as @location' do
          Location.stub(:find) { location }
          put :update, :id => '1'
          assigns(:location).should be(location)
        end

        it 'redirects to the location' do
          Location.stub(:find) { location }
          put :update, :id => '1'
          response.should redirect_to(location_url(location))
        end
      end

      describe 'with invalid params' do
        before do
          location.stub(:update_attributes).and_return(false)
        end

        it 'assigns the location as @location' do
          Location.stub(:find) { location }
          put :update, :id => '1'
          assigns(:location).should be(location)
        end

        it "re-renders the 'edit' template" do
          Location.stub(:find) { location }
          put :update, :id => '1'
          response.should render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested location' do
        Location.should_receive(:find).with('37') { location }
        location.should_receive(:destroy)
        delete :destroy, :id => '37'
      end

      it 'redirects to the locations list' do
        Location.stub(:find) { location }
        delete :destroy, :id => '1'
        response.should redirect_to(locations_url)
      end
    end
  end

  context 'when the user has no special privileges' do
    describe 'GET show' do
      it 'is not authorized' do
        proc { get :show, :id => '37' }
          .should raise_error CanCan::AccessDenied
      end
    end

    describe 'GET new' do
      it 'is not authorized' do
        proc { get :new }
          .should raise_error CanCan::AccessDenied
      end
    end

    describe 'POST create' do
      it 'is not authorized' do
        proc { post :create }
          .should raise_error CanCan::AccessDenied
      end
    end

    describe 'GET edit' do
      it 'is not authorized' do
        proc { get :edit, :id => '37' }
          .should raise_error CanCan::AccessDenied
      end
    end

    describe 'PUT update' do
      it 'is not authorized' do
        proc { put :update, :id => '37' }
          .should raise_error CanCan::AccessDenied
      end
    end

    describe 'DELETE destroy' do
      it 'is not authorized' do
        proc { put :update, :id => '37' }
          .should raise_error CanCan::AccessDenied
      end
    end
  end
end
