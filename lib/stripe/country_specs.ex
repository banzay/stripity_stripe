defmodule Stripe.CountrySpecs do
  @moduledoc """
  Retrieve Country Specs from the Stripe API.
  (API ref: https://stripe.com/docs/api#country_specs)

  Operations:
  - retrieve
  - list
  """

  @endpoint "country_specs"

  @doc """
  Returns a CountrySpecs object.

  ## Arguments

  - `country` - `String` - An ISO 3166-1 alpha-2 country code.
  Available country codes can be listed with the List Country Specs endpoint.

  ## Example

  ```
    {:ok, country_specs} = Stripe.CountrySpecs.retrieve(country)
  ```
  """
  def retrieve(country) do
    path = @endpoint <> "/" <> country

    Stripe.make_request(:get, path, %{}, %{})
    |> Stripe.Util.handle_stripe_response
  end

  @doc """
  Returns a list of CountrySpecs if valid arguments provided.

  ## Arguments

  - `starting_after` - `String` - (optional), default is `""` - Country code, used as a cursor for pagination.
  - `limit` - `Integer` - (optional), default is `10` - Limit can range between 1 and 100 items.

  ## Example

  ```
  {:ok, country_specs_list} = Stripe.CountrySpecs.list(starting_after, limit)
  ```
  """
  def list(starting_after \\ "", limit \\ 10) do
    list Stripe.config_or_env_key, starting_after, limit
  end

  @doc """
  Returns a list of CountrySpecs, using a given stripe key.

  ## Example

  ```
  {:ok, country_specs_list} = Stripe.CountrySpec.list(key, "CA", 20)
  ```
  """
  def list(key, starting_after, limit) do
    Stripe.Util.list(@endpoint, key, starting_after, limit)
  end
end
