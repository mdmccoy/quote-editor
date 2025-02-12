class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      respond_to do |format|
        # Example of rendering the turbo_steam response in the format block
        # You can also use a dedicated view like create.turbo_stream.slim
        # And you can disable Turbo on the request and force an HTML response w/ data: { turbo: false } on the element
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("edit_quote_#{@quote.id}", partial: "form", locals: { quote: @quote })
        end
        format.html { render :edit }
      end
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
