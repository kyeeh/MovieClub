require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :imdb_id => 1,
      :data => "MyText"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[imdb_id]"

      assert_select "textarea[name=?]", "movie[data]"
    end
  end
end
