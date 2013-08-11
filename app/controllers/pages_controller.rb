class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show

    #Rails.logger.info "cookie #{cookies[:notacms]}"
    @page = Page.find_by_id(params[:id])

    @page ||= Page.new(content: 'Page content not found', title: 'Page not found', top: 100, left: 100, width: 200, height: 200)

    #render json: @page.attributes.merge(follower_id: 45).to_json

    @position = @page.positions.find_by_user_id(cookies[:notacms])
    if @position
      Rails.logger.info('found position')
      @page.left = @position.left
      @page.top = @position.top
      @page.width = @position.width
      @page.height = @position.height
    else
      @position = @page.positions.create(user_id: cookies[:notacms], left: @page.left, top: @page.top, width: @page.width, height: @page.height)
    end
    render json: @page.attributes.merge(position_id: @position.id).to_json

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @page }
    #end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
