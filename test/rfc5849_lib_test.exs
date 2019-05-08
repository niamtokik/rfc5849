defmodule Rfc5849.LibTest do
  use ExUnit.Case

  
  test "URI" do
    :ok
  end

  test "do percent encoding" do
    original = "https://photos.example.net/initiate"
    result = "https%3A%2F%2Fphotos.example.net%2Finitiate"
    assert(Rfc5849.Lib.encode_percent(original) == result)
  end
  
  test "generate signature base string" do
    struct = model_base_string()
    result = ["POST&http%3A%2F%2Fexample.com%2Frequest&a2%3Dr%2520b%26a3%3D2%2520q",
	      "%26a3%3Da%26b5%3D%253D%25253D%26c%2540%3D%26c2%3D%26oauth_consumer_",
	      "key%3D9djdj82h48djs9d2%26oauth_nonce%3D7d8f3e4a%26oauth_signature_m",
	      "ethod%3DHMAC-SHA1%26oauth_timestamp%3D137131201%26oauth_token%3Dkkk",
	      "9d7dh3k39sjv7"]
    assert(Rfc5849.Lib.base_string(struct) == result)
  end
  
  test "set token secret" do
    struct = %Rfc5849{}
    Rfc5849.Lib.token_secret(struct)
  end

  test "set consumer secret" do
    struct = %Rfc5849{}
    Rfc5849.Lib.consumer_secret(struct)
  end
  
  test "generate nonce" do
    struct = %Rfc5849{}
    Rfc5849.Lib.nonce(struct)
  end

  test "generate timestamp" do
    struct = %Rfc5849{}
    Rfc5849.Lib.timestamp(struct)
  end

  test "generate plaintext signature" do
    struct = %Rfc5849{}
    Rfc5849.Lib.signature(struct, :plain)
  end

  test "generate hmac-sha1 signature" do
    struct = %Rfc5849{}
    Rfc5849.Lib.signature(struct, :hmac_sha1)
  end

  test "generate rsa-sha1 signature" do
    struct = %Rfc5849{}
    Rfc5849.Lib.signature(struct, :rsa_sha1)
  end

  defp model1 do
    %Rfc5849{
      consumer_key: "dpf43f3p2l4k3l03",
      consumer_secret: "kd94hf93k423kf44",
      signature_method: "HMAC-SHA1",
      timestamp: "137131200",
      nonce: "wIjqoS",
      callback: "http%3A%2F%2Fprinter.example.com%2Fready",
      signature: "74KNZJeDHnMBp0EMJ9ZHt%2FXKycU%3D",
      realm: "Photos"
    }
  end

  defp model2 do
    %Rfc5849{
      consumer_key: "dpf43f3p2l4k3l03",
      consumer_secret: "kd94hf93k423kf44",
      token: "hh5s93j4hdidpola",
      signature_method: "HMAC-SHA1",
      timestamp: "137131201",
      nonce: "walatlh",
      verifier: "hfdp7dh39dks9884",
      callback: "http%3A%2F%2Fprinter.example.com%2Fready",
      signature: "gKgrFCywp7rO0OXSjdot%2FIHF7IU%3D",
      realm: "Photos"
    }
  end

  defp model3 do
    %Rfc5849{
      consumer_key: "dpf43f3p2l4k3l03",
      consumer_secret: "kd94hf93k423kf44",
      token: "nnch734d00sl2jdk",
      signature_method: "HMAC-SHA1",
      timestamp: "137131202",
      nonce: "chapoH",
      verifier: "hfdp7dh39dks9884",
      signature: "MdpQcU8iPSUjWoN%2FUDMsK2sui9I%3D",
      realm: "Photos"      
    }
  end

  def model_base_string do
    %Rfc5849{
      consumer_key: "9djdj82h48djs9d2",
      consumer_secret: "kd94hf93k423kf44",
      token: "kkk9d7dh3k39sjv7",
      signature_method: "HMAC-SHA1",
      timestamp: "137131201",
      nonce: "7d8f3e4a",
      signature: "MdpQcU8iPSUjWoN%2FUDMsK2sui9I%3D",
      realm: "bYT5CMsGcbgUdFHObYMEfcx6bsw%3D"
    }
  end
  
end
