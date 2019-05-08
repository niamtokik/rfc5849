defmodule Rfc5849 do
  
  @moduledoc """
  Rfc5849 implement oauth/1 as GenServer OTP behaviour.

  fixed value


  """

  defstruct [
    consumer_key: nil,
    consumer_secret: nil, # must be protected
    token: nil,
    token_secret: nil, # must be protected    
    callback: nil,
    verifier: nil,
    signature: nil,
    signature_method: :hmac_sha1,
    timestamp: nil,
    nonce: nil
  ]
  
  use GenServer

  @doc """
  """
  def init(args) do
    {:ok, args}
  end

  @doc """
  """
  def terminate(reason, state) do
  end

  @doc """
  """
  def handle_call(message, from, state) do
  end

  @doc """
  """
  def handle_cast({:set, {:client, param}}, state) do
    case param do
      {:method, method} -> :ok
      {:headers, headers} -> :ok
      {:params, params} -> :ok
    end
  end
  def handle_cast({:set, {:oauth, oauth}}, state) do
    case oauth do
      {:consumer_key, consumer_key} -> :ok
      {:consumer_secret, consumer_secret} -> :ok
      {:token, token} -> :ok
      {:token_secret, token_secret} -> :ok
      {:signature_method, signature_method} -> :ok
    end
  end
  def handle_cast(message, state) do
  end

  @doc """
  """
  def handle_info(message, state) do
  end

end
