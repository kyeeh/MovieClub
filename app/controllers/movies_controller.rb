class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /search
  # GET /search.json
  def search
    @movies = []
    if params[:query]
      @movies = Movie.search(params[:query])
    end
  end

  # GET /movies
  # GET /movies.json
  def index
    @movies = current_user.movies.order(:release_date)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/1/recommendations
  def recommendation
    @movie = Movie.get(tmdb_id_param["id"])
    @movies = Movie.get_recommendation(tmdb_id_param["id"])
  end  

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end


  # POST /movies
  # POST /movies.json
  def add
    @movie = Movie.get(tmdb_id_param["id"])
    @movie.users << current_user

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully added to your list.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:img_url, :title, :release_date, :genre, :duration, :query)
    end

    # This Movie ID is given by TMDB API
    def tmdb_id_param
      params.permit(:id)
    end 
end
