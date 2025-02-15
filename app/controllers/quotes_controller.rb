class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]
  before_action :set_quotes, only: [ :index, :destroy ]

  def index
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
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
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
      end
    else
      respond_to do |format|
        # Example of rendering the turbo_steam response in the format block
        # You can also use a dedicated view like create.turbo_stream.slim
        # And you can disable Turbo on the request and force an HTML response w/ data: { turbo: false } on the element
        # If you want to perform an action on an element outside of the turbo frame that invoked the action,
        # (your button/link is inside a turbo frame), then use a .turbo_stream.erb view

        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.replace("edit_quote_#{@quote.id}", partial: "form", locals: { quote: @quote })
        # end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def set_quotes
    @quotes = current_company.quotes.ordered
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
