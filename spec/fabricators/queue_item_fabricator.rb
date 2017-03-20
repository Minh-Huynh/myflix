Fabricator(:queue_item) do
  rank {Fabricate.sequence(:number, 1)}
end