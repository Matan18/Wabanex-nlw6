defmodule Wabanex.ImcTest do
  use ExUnit.Case, async: true

  alias Wabanex.Imc

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = Imc.calculate(params)

      expected_response =
        {:ok,
         %{
           "Dani" => 23.437499999999996,
           "Diego" => 23.04002019946976,
           "Mateus" => 24.724520008546747,
           "Rafael" => 24.897060231734173
         }}

      assert response == expected_response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = Imc.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
