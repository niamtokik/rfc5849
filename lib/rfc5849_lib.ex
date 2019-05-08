defmodule Rfc5849.Lib do

  @moduledoc """
  > request = %Rfc5849{}
  > Rfc5849.Lib.request(request)
  {:ok, method, target, header, params}
  """

  def encode_percent(str) do
    str |> URI.encode(&URI.char_unreserved?/1)
  end

  @doc """
  Add a nonce (24bytes) in Rfc5849 structure
  """
  @spec nonce(Rfc5849.t()) :: Rfc5849.t()
  def nonce(struct) do
    nonce(struct, 24)
  end

  @doc """
  Add a nonce with a defined size in Rfc5849 structure
  """
  @spec nonce(Rfc5849.t(), integer()) :: Rfc5849.t()
  def nonce(struct, size) do
    %Rfc5849{struct|nonce: gen_nonce(size)}
  end

  @doc """
  Generate a nonce with `:crypto.string_rand_bytes` function and
  encode it in base64. This code is based on OAuther.
  """
  defp gen_nonce(size) do
    :crypto.strong_rand_bytes(size) |> Base.encode64()
  end
  
  @doc """
  add a timestamp to Rfc5849 structure.
  """
  @spec timestamp(Rfc5849.t()) :: Rfc5849.t()
  def timestamp(struct) do
    %Rfc5849{struct|timestamp: gen_timestamp()}
  end

  @doc """
  Generate a timestamp based on `:os.timestamp()` function. This code
  is based on OAuther
  """
  defp gen_timestamp() do
    {megasec, sec, _microsec} = :os.timestamp()
    megasec * 1_000_000 + sec
  end

  @doc """
  Generate a signature based on information present in the Rfc5849
  structure
  """
  @spec sign(Rfc5849.t()) :: Rfc5849.t()
  def sign(%Rfc5849{signature_method: signature_method} = struct) do
  end

  @doc """
  Generate a signature based on information in the Rfc5849 with a
  different method.
  """
  @spec sign(Rfc5849.t(), atom()) :: Rfc5849.t()
  def sign(struct, method) do
    :ok
  end
  
  @doc """
  Generate a plaintext signature and return it
  """
  @spec gen_signature_plain(Rfc5849.t()) :: string()
  defp gen_signature_plain(struct) do
    :ok
  end

  @doc """
  Generate hmac-sha1 signature and return it.
  """
  @spec gen_signature_sha1(Rfc5849.t()) :: string()
  defp gen_signature_sha1(struct) do
    :ok
  end

  @doc """
  Generate rsa-sha1 signature and return it.
  """
  @spec gen_signature_rsa(Rfc5849.t()) :: string()
  defp gen_signature_rsa(struct) do
    :ok
  end


  @doc """
  Change the signature_method and regenerate the signature
  """
  @spec signature_method(Rfc5849.t(), string()) :: Rfc5849.t()
  def signature_method(struct, method) do
    %Rfc5849{struct|signature_method: method} |> sign
  end

  @doc """
  Set the callback and encode it correctly.
  """
  @spec callback(Rfc5849.t(), string()) :: Rfc5849.t()
  def callback(struct, callback) do
    %Rfc5849{struct|callback: callback}
  end

  @doc """
  Set the verifier and encode it correctly.
  """
  @spec verifier(Rfc5849.t(), string() | function()) :: Rfc5849.t()
  def verifier(struct, verifier) do
    %Rfc5849{struct|verifier: verifier}
  end

  @doc """
  Set the consumer_secret, this value can be a function returning
  {:ok, secret} or a string.
  """
  @spec consumer_secret(Rfc5849.t(), string() | function()) :: Rfc5849.t()
  def consumer_secret(struct, secret) do
  end

  @doc """
  Set the token_secret, this value can be a function returning
  {:ok, secret} or a string.
  """
  @spec token_secret(Rfc5849.t(), string() | function()) :: Rfc5849.t()
  def token_secret(struct, secret) do
  end

  @doc """
  Generate a base string based on the content of the structure
  """
  def gen_base_string(struct) do
    method = struct.method
    host = struct.host
    path = struct.path
    query = struct.query
  end
end
