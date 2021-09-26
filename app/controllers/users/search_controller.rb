class Users::SearchController < ApplicationController

  def search
    # ↓選択したmodelを@modelに代入
    @model = params["search"]["model"]
    # ↓検索にかけた文字列を@valueに代入
    @value = params["search"]["value"]
    # ↓選択した検索方法howを@howに代入
    @how = params["search"]["how"]
    # ↓search_forの引数にインスタンス変数を定義、最終的な検索結果が入る
    @datas = search_for(@how, @model, @value)
    
    @user = current_user
    
  end
  
  
  private
  # ↓def search_forでhowがmatchだった場合の処理
  def match(model, value)
    # ↓modelがuserの場合の処理
    if model == 'user'
      # ↓whereでvalueと完全一致するuser_nameを探す
      User.where(user_name: value)
    elsif model == 'post'
      Post.where(title: value)
    end
  end

  def forward(model, value)
    if model == 'User'
      User.where("user_name LIKE ?", "#{value}%")
    elsif model == 'post'
      Post.where("title LIKE ?", "#{value}%")
    end
  end

  def backward(model, value)
    if model == 'user'
      User.where("user_name LIKE ?", "%#{value}")
    elsif model == 'post'
      Post.where("title LIKE ?", "%#{value}")
    end
  end

  def partical(model, value)
    if model == 'user'
      User.where("user_name LIKE ?", "%#{value}%")
    elsif model == 'post'
      Post.where("title LIKE ?", "%#{value}%")
    end
  end

  # ↓searchアクションで定義した情報が引数に入る
  # 検索方法の引数に(model, value)を定義
  def search_for(how, model, value)
    case how
    when 'match'
      match(model, value)
    when 'forward'
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end
  end

end
