class Item < Grape::API
  resource :item do
    desc '商品情報を取得する' do
      detail '商品の情報とコンディションごとの価格を取得する'
      success Entities::Item
      failure Root::ERROR_CODES
    end
    params do
      requires :jan_code, type: String, desc: '商品のJANコード'
    end
    get do
    end
  end
end
