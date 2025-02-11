defprotocol ExProtobuf.Serializable do
  @moduledoc """
  Defines the contract for serializing ExProtobuf messages.
  """
  @fallback_to_any true

  @doc """
  Serializes the provided object as a ExProtobuf message in binary form.
  """
  def serialize(object)
end

defimpl ExProtobuf.Serializable, for: Any do
  def serialize(%{__struct__: module} = obj), do: module.encode(obj)
  def serialize(_), do: {:error, :not_serializable}
end
