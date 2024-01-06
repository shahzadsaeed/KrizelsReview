require 'axlsx'

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all
  end

  def show; end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to '/', notice: 'Review was successfully submited.' }
        format.json { render :submit_review, status: :created, location: @review }
      else
        format.html { render :submit_review, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: 'Review was successfully updated.' }
        format.json { render :submit_review, status: :ok, location: @review }
      else
        format.html { render :submit_review, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_review
    @review = Review.new
  end

  def download_reviews_excel
    reviews = Review.all # Fetch all reviews from your database

    package = Axlsx::Package.new
    workbook = package.workbook

    workbook.add_worksheet(name: 'Reviews') do |sheet|
      # Add headers
      sheet.add_row %w[Title Review Name Rating Order_ID]

      # Add review data
      reviews.each do |review|
        sheet.add_row [review.title, review.review, review.name, review.rating, review.order_id]
      end
    end

    file_path = Rails.root.join('tmp', 'reviews.xlsx')
    package.serialize(file_path)

    send_file(file_path, filename: 'reviews.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :review, :name, :rating, :order_id)
  end
end
