class PiecesController < ApplicationController

  def search
    composer_ids = params[:composer_ids] 
    genre_ids = params[:genre_ids]
    
    if composer_ids.present?
      @q = Piece.ransack(composer_id_in: composer_ids, genre_id_in: genre_ids)
      @pieces = @q.result
    else
      @pieces = Piece.all
    end

    instruments = {
      picc: { quantity: 0, max_times: 0, min_times: 0 },
      fl: { quantity: 0, max_times: 0, min_times: 0 },
      cl: { quantity: 0, max_times: 0, min_times: 0 },
      ob: { quantity: 0, max_times: 0, min_times: 0 },
      eh: { quantity: 0, max_times: 0, min_times: 0 },
      bcl: { quantity: 0, max_times: 0, min_times: 0 },
      fg: { quantity: 0, max_times: 0, min_times: 0 },
      cfg: { quantity: 0, max_times: 0, min_times: 0 },
      hr: { quantity: 0, max_times: 0, min_times: 0 },
      tp: { quantity: 0, max_times: 0, min_times: 0 },
      cnt: { quantity: 0, max_times: 0, min_times: 0 },
      tb: { quantity: 0, max_times: 0, min_times: 0 },
      tuba: { quantity: 0, max_times: 0, min_times: 0 },
      perc: { quantity: 0, max_times: 0, min_times: 0 }
    }

    instruments.each_key do |key|
      instruments[key][:quantity] = params["#{key}_quantity"].present? ? params["#{key}_quantity"].to_i : 0
      instruments[key][:max_times] = params["#{key}_max_times"].present? ? params["#{key}_max_times"].to_i : nil
      instruments[key][:min_times] = params["#{key}_min_times"].present? ? params["#{key}_min_times"].to_i : 0
    end

    picc_id = 1
    fl_id = 2
    cl_id = 3
    ob_id = 4
    eh_id = 5
    bcl_id = 6
    fg_id = 7
    cfg_id = 8
    hr_id = 9
    tp_id = 10
    cnt_id = 11
    tb_id = 12
    tuba_id = 13
    perc_id = 14

    piece_ids = @pieces.pluck(:id)

    @pieces = Piece.joins("JOIN piece_instruments p1_picc ON pieces.id = p1_picc.piece_id")
    .joins("JOIN pieces piece2 ON piece2.id != pieces.id")  # pieces テーブルを2回目に結合して異なる曲を取得
    .joins("JOIN piece_instruments p2_picc ON piece2.id = p2_picc.piece_id")
    .where("pieces.id IN (?) AND piece2.id IN (?)", piece_ids, piece_ids)
                   .joins("JOIN piece_instruments p1_fl ON p1_picc.piece_id = p1_fl.piece_id")
                   .joins("JOIN piece_instruments p2_fl ON p2_picc.piece_id = p2_fl.piece_id")
                   .joins("JOIN piece_instruments p1_cl ON p1_picc.piece_id = p1_cl.piece_id")
                   .joins("JOIN piece_instruments p2_cl ON p2_picc.piece_id = p2_cl.piece_id")
                   .joins("JOIN piece_instruments p1_ob ON p1_picc.piece_id = p1_ob.piece_id")
                   .joins("JOIN piece_instruments p2_ob ON p2_picc.piece_id = p2_ob.piece_id")
                   .joins("JOIN piece_instruments p1_eh ON p1_picc.piece_id = p1_eh.piece_id")
                   .joins("JOIN piece_instruments p2_eh ON p2_picc.piece_id = p2_eh.piece_id")
                   .joins("JOIN piece_instruments p1_bcl ON p1_picc.piece_id = p1_bcl.piece_id")
                   .joins("JOIN piece_instruments p2_bcl ON p2_picc.piece_id = p2_bcl.piece_id")
                   .joins("JOIN piece_instruments p1_fg ON p1_picc.piece_id = p1_fg.piece_id")
                   .joins("JOIN piece_instruments p2_fg ON p2_picc.piece_id = p2_fg.piece_id")
                   .joins("JOIN piece_instruments p1_cfg ON p1_picc.piece_id = p1_cfg.piece_id")
                   .joins("JOIN piece_instruments p2_cfg ON p2_picc.piece_id = p2_cfg.piece_id")
                   .joins("JOIN piece_instruments p1_hr ON p1_picc.piece_id = p1_hr.piece_id")
                   .joins("JOIN piece_instruments p2_hr ON p2_picc.piece_id = p2_hr.piece_id")
                   .joins("JOIN piece_instruments p1_tp ON p1_picc.piece_id = p1_tp.piece_id")
                   .joins("JOIN piece_instruments p2_tp ON p2_picc.piece_id = p2_tp.piece_id")
                   .joins("JOIN piece_instruments p1_cnt ON p1_picc.piece_id = p1_cnt.piece_id")
                   .joins("JOIN piece_instruments p2_cnt ON p2_picc.piece_id = p2_cnt.piece_id")
                   .joins("JOIN piece_instruments p1_tb ON p1_picc.piece_id = p1_tb.piece_id")
                   .joins("JOIN piece_instruments p2_tb ON p2_picc.piece_id = p2_tb.piece_id")
                   .joins("JOIN piece_instruments p1_tuba ON p1_picc.piece_id = p1_tuba.piece_id")
                   .joins("JOIN piece_instruments p2_tuba ON p2_picc.piece_id = p2_tuba.piece_id")
                   .joins("JOIN piece_instruments p1_perc ON p1_picc.piece_id = p1_perc.piece_id")
                   .joins("JOIN piece_instruments p2_perc ON p2_picc.piece_id = p2_perc.piece_id")
                   .where("p1_picc.instrument_id = ? AND p2_picc.instrument_id = ?", picc_id, picc_id)
                   .where("p1_fl.instrument_id = ? AND p2_fl.instrument_id = ?", fl_id, fl_id)
                   .where("p1_cl.instrument_id = ? AND p2_cl.instrument_id = ?", cl_id, cl_id)
                   .where("p1_ob.instrument_id = ? AND p2_ob.instrument_id = ?", ob_id, ob_id)
                   .where("p1_eh.instrument_id = ? AND p2_eh.instrument_id = ?", eh_id, eh_id)
                   .where("p1_bcl.instrument_id = ? AND p2_bcl.instrument_id = ?", bcl_id, bcl_id)
                   .where("p1_fg.instrument_id = ? AND p2_fg.instrument_id = ?", fg_id, fg_id)
                   .where("p1_cfg.instrument_id = ? AND p2_cfg.instrument_id = ?", cfg_id, cfg_id)
                   .where("p1_hr.instrument_id = ? AND p2_hr.instrument_id = ?", hr_id, hr_id)
                   .where("p1_tp.instrument_id = ? AND p2_tp.instrument_id = ?", tp_id, tp_id)
                   .where("p1_cnt.instrument_id = ? AND p2_cnt.instrument_id = ?", cnt_id, cnt_id)
                   .where("p1_tb.instrument_id = ? AND p2_tb.instrument_id = ?", tb_id, tb_id)
                   .where("p1_tuba.instrument_id = ? AND p2_tuba.instrument_id = ?", tuba_id, tuba_id)
                   .where("p1_perc.instrument_id = ? AND p2_perc.instrument_id = ?", perc_id, perc_id)
                   .group('p1_picc.piece_id, p2_picc.piece_id')

    instruments.each do |key, values|
      apply_instrument_conditions(key.to_s, values[:quantity], values[:max_times], values[:min_times])
    end

    @pieces = @pieces.select('p1_picc.piece_id AS piece1_id, p2_picc.piece_id AS piece2_id, 
                            SUM(p1_picc.quantity) + SUM(p2_picc.quantity) AS total_picc_quantity, 
                            SUM(p1_fl.quantity) + SUM(p2_fl.quantity) AS total_fl_quantity,
                            SUM(p1_cl.quantity) + SUM(p2_cl.quantity) AS total_cl_quantity,
                            SUM(p1_ob.quantity) + SUM(p2_ob.quantity) AS total_ob_quantity,
                            SUM(p1_eh.quantity) + SUM(p2_eh.quantity) AS total_eh_quantity,
                            SUM(p1_bcl.quantity) + SUM(p2_bcl.quantity) AS total_bcl_quantity,
                            SUM(p1_fg.quantity) + SUM(p2_fg.quantity) AS total_fg_quantity,
                            SUM(p1_cfg.quantity) + SUM(p2_cfg.quantity) AS total_cfg_quantity,
                            SUM(p1_hr.quantity) + SUM(p2_hr.quantity) AS total_hr_quantity, 
                            SUM(p1_tp.quantity) + SUM(p2_tp.quantity) AS total_tp_quantity,
                            SUM(p1_cnt.quantity) + SUM(p2_cnt.quantity) AS total_cnt_quantity,
                            SUM(p1_tb.quantity) + SUM(p2_tb.quantity) AS total_tb_quantity,
                            SUM(p1_tuba.quantity) + SUM(p2_tuba.quantity) AS total_tuba_quantity,
                            SUM(p1_perc.quantity) + SUM(p2_perc.quantity) AS total_perc_quantity,
                            p1_picc.piece_id AS piece1_name, p2_picc.piece_id AS piece2_name')
  end

  private

  def apply_instrument_conditions(instrument_code, quantity, max_times, min_times)
    max_limit = max_times ? quantity * max_times : nil
    min_limit = quantity * min_times
  
    if max_times && max_times > 0
      @pieces = @pieces.having("SUM(p1_#{instrument_code}.quantity) + SUM(p2_#{instrument_code}.quantity) <= ?", max_limit)
    elsif max_times == 0
      @pieces = @pieces.having("SUM(p1_#{instrument_code}.quantity) + SUM(p2_#{instrument_code}.quantity) = 0")
    end
  
    if min_times > 0
      @pieces = @pieces.having("SUM(p1_#{instrument_code}.quantity) + SUM(p2_#{instrument_code}.quantity) >= ?", min_limit)
    end
  end
end

