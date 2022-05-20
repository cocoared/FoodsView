module ApplicationHelper
  def score_average(food)
    fd = Food.find_by(item_code:  food['itemCode'] )
    if fd
      score = fd.comments.average(:rate)
    else
      score = 0
    end
  end
end
