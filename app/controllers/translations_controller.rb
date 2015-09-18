class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[show edit update destroy]
  before_action :set_document, only: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]
  before_action :own_translation, only: %i[edit update destroy]

  # GET /translations
  # GET /translations.json
  def index
    @translations = @document ? @document.translations : Translation.all
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = @document.translations.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = @document.translations.new(translation_params)
    @translation.user = current_user

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, flash: { success: 'Translation was successfully created.' } }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, flash: { success: 'Translation was successfully updated.' } }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, flash: { success: 'Translation was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    def set_translation
      @translation = Translation.find(params[:id])
    end

    def set_document
      @document = params[:document_id] ? Document.find(params[:document_id]) : nil
    end

    def own_translation
      unless current_user == @translation.user
        redirect_to @translation, flash: { error: 'You may only make changes to translations you submitted yourself.' }
      end
    end

    def translation_params
      params.require(:translation).permit(:document_id, :analysis)
    end
end
