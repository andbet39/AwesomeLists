class ListEntriesController < ApplicationController
  before_action :set_list_entry, only: [:show, :edit, :update, :destroy]

  # GET /list_entries
  # GET /list_entries.json
  def index
    @list_entries = ListEntry.all
  end

  # GET /list_entries/1
  # GET /list_entries/1.json
  def show
  end

  # GET /list_entries/new
  def new
    @list_entry = ListEntry.new
  end

  # GET /list_entries/1/edit
  def edit
  end

  # POST /list_entries
  # POST /list_entries.json
  def create
    @list_entry = ListEntry.new(list_entry_params)

    respond_to do |format|
      if @list_entry.save
        format.html { redirect_to @list_entry, notice: 'List entry was successfully created.' }
        format.json { render :show, status: :created, location: @list_entry }
      else
        format.html { render :new }
        format.json { render json: @list_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_entries/1
  # PATCH/PUT /list_entries/1.json
  def update
    respond_to do |format|
      if @list_entry.update(list_entry_params)
        format.html { redirect_to @list_entry, notice: 'List entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_entry }
      else
        format.html { render :edit }
        format.json { render json: @list_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_entries/1
  # DELETE /list_entries/1.json
  def destroy
    @list_entry.destroy
    respond_to do |format|
      format.html { redirect_to list_entries_url, notice: 'List entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_entry
      @list_entry = ListEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_entry_params
      params.require(:list_entry).permit(:title, :url, :description, :category, :subcategory, :list_id)
    end
end
