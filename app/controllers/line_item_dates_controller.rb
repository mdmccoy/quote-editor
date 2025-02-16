class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [ :edit, :update, :destroy ]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
        format.html { redirect_to quote_path(@quote), notice: "Date was successfully created." }
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
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
        format.html { redirect_to quote_path(@quote), notice: "Date was successfully updated." }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item_date.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
      format.html { redirect_to quote_path(@quote), notice: "Date was successfully destroyed." }
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end
end
