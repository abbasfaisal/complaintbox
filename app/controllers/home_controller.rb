class HomeController < ApplicationController
  before_filter :authorize

  def index
    begin
      @areas = Area.all

      @page = params[:page].to_i || 0
      @totalcomplaints = Complaint.where(:areaname => params[:area]).all.offset(15 * @page)
      @complaints = @totalcomplaints.limit(15)
      @areaname = params[:area]
      if request.xhr?
        respond_to do |format|
          format.js
        end
      end
    rescue => ex
      redirect_to :action => 'error_page'
    end
  end

  def error_page
    respond_to do |format|
      format.js
    end
  end

  def delete_complaint
    begin
      Complaint.transaction do
        Complaint.where(:id => params[:complaints]).destroy_all
      end

      render :nothing => true, :status => :ok
    rescue
      render :nothing => true, :status => :internal_server_error
    end
  end

  def mark_unread
    begin
      Complaint.transaction do
        Complaint.where(:id => params[:complaints]).update_all(read: false)
      end

      render :nothing => true, :status => :ok
    rescue
      render :nothing => true, :status => :internal_server_error
    end
  end

  def get_complaint
    @page = params[:page]
    @areaname = params[:area]
   
    begin 
      @complaint = Complaint.find(params[:complaintid])
      @complaint.update(read: true)
      respond_to do |format|
        format.js
      end
    rescue
      redirect_to :action => 'error_page'
    end
  end

end
