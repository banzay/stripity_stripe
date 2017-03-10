defmodule Stripe.CustomerTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "List works" do
    use_cassette "country_specs_test/list", match_requests_on: [:query, :request_body] do
      case Stripe.CountrySpecs.list("", 3) do
        {:ok, country_specs_list} -> assert length(country_specs_list[:data]) == 3
        {:error, err} -> flunk err
      end
    end
  end

  test "List w/key works" do
    use_cassette "country_specs_test/list_with_key", match_requests_on: [:query, :request_body] do
      case Stripe.CountrySpecs.list(Stripe.config_or_env_key, "", 3) do
        {:ok, country_specs_list} -> assert length(country_specs_list[:data]) == 3
        {:error, err} -> flunk err
      end
    end
  end

  test "Retrieve works" do
    use_cassette "country_specs_test/retrieve", match_requests_on: [:query, :request_body] do
      case Stripe.CountrySpecs.retrieve("US") do
        {:ok, country_specs} -> assert country_specs.id == "US"
        {:error, err} -> flunk err
      end
    end
  end
end
