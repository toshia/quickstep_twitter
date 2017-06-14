# -*- coding: utf-8 -*-

Plugin.create(:quickstep_twitter) do

  # このスクリーンネームを持ったユーザのプロフィールを開く
  filter_quickstep_query do |query, yielder|
    if /\w/ =~ query
      yielder << Retriever::URI!("https://twitter.com/#{query}")
    end
    [query, yielder]
  end

  # Twitter検索でこのキーワードを検索する
  filter_quickstep_query do |query, yielder|
    if /\S/ =~ query
      yielder << Retriever::Model(:twitter_search).new(query: query)
    end
    [query, yielder]
  end
end
