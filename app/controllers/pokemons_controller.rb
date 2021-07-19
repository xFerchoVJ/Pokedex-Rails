class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.save
    redirect_to pokemons_path
  end

  def show
    set_pokemon
  end

  def edit
    set_pokemon
  end

  def update
    set_pokemon
    @pokemon.update(pokemon_params)
  end

  def destroy
    set_pokemon
    @pokemon.destroy

    redirect_to pokemons_path
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :image)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
