class AttendsController < ApplicationController
  before_action :set_attend, only: [:show, :edit, :update, :destroy]
  before_action :set_namehash

  def register
  end

  def invite 
    @attend = Attend.new
    name = params[:name]
    if @namehash.key?(name.to_sym)
    	@attend.name = @namehash[name.to_sym]
    else
	@attend.name = name
    end
 #   render :text => name
  end

  def invite_en
    @english = true
    @attend = Attend.new
    name = params[:name]
    if @namehash.key?(name.to_sym)
    	@attend.name = @namehash[name.to_sym]
    else
	@attend.name = name
    end
  end

  def payment

  end

  def q2

  end

  def payment_en
    @english = true
    render :action => 'payment'
  end

  def top
#	render :text => 'top page'
  end

  # GET /attends
  # GET /attends.json
  def index
    @attends = Attend.all
  end

  # GET /attends/1
  # GET /attends/1.json
  def show
  end

  # GET /attends/new
  def new
    @attend = Attend.new
  end

  # GET /attends/1/edit
  def edit
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = Attend.new(attend_params)

    respond_to do |format|
      if @attend.save
        format.html { redirect_to action: "register", notice: 'Attend was successfully created.' }
        format.json { render :show, status: :created, location: @attend }
      else
	flash.now[:error] = "submit is unsuccessful."
        format.html { render :invite }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
    #render :html => "register"
  end

  # PATCH/PUT /attends/1
  # PATCH/PUT /attends/1.json
  def update
    respond_to do |format|
      if @attend.update(attend_params)
        format.html { redirect_to @attend, notice: 'Attend was successfully updated.' }
        format.json { render :show, status: :ok, location: @attend }
      else
        format.html { render :edit }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend.destroy
    respond_to do |format|
      format.html { redirect_to attends_url, notice: 'Attend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_params
      params.require(:attend).permit(:name, :attend, :payment, :comment)
    end

    def set_namehash
	@namehash = {
		matsuda_toshihiro: '松田 俊宏',
		etsuda_shogo: '悦田 翔悟',
		yamada_goro: '山田 吾郎',
		sasaki_yusuke: '佐々木 裕介',
		fujiki_tetsuya: '藤木 哲也',
		numaguchi_naoki: '沼口 直紀',
		takado_kazuyuki: '高土 和行',
		hirota_chiharu: '廣田 千春',
		ando_yuki: '安藤 裕紀',
		hayashi_ginji: '林 吟志',
		hayase_hiroki: '早瀬 裕輝',
		murata_kaori: '村田 香織',
		yamaba_yuki: '山羽 佑樹',
		shiratori_keita: '白鳥 啓太',
		nagase_kazuki: '永瀬 一貴',
		hiratsuka_nobuaki: '平塚 信明',
		igarashi_naoto: '五十嵐 直人',
		chiba_daiki: '千葉 大輝',
		konno_kenshiro: '今野 建志郎',
		katagiri_hiroshi: '片桐 浩',
		morimoto_kazushi: '森本 和志',
		yamada_masaki: '山田 聖喜',
		yoshiki_tsuchimoto: '土本 良樹',
		kyono_masatoshi: '教野 雅利',
		sekino_takehisa: '関野 剛永',
		ishii_yasuhiro: '石井 康博',
		ikeda_hiroaki: '池田 浩明',
		kawano_ryohei: '川野 亮平',
		kito_toyokazu: '鬼頭 豊和',
		machida_katsuki: '町田 克樹',
		kuroiwa_junpei: '黒岩 潤平',
		komuro_takeyuki: '小室 健行',
		keiko_nagahama: 'Keiko Nagahama',
		daniel_smadja: 'Daniel Smadja',
		shuji_oya: 'Shuji Oya',
		sayumi_oya: 'Sayumi Oya',
		naoko_oguma: 'Naoko Oguma',
		takashi_ueda: 'Takashi Ueda',
		shin_tanahara: 'Shin Tanahara',
		yutaro_shimizu: 'Yutaro Shimizu',
		kanako_shimizu: 'Kanako Shimizu',
		wada_rina: 'Wada Rina',
		alexandre_plattard: 'Alexandre Plattard',
		aki_nakashima: 'Aki Nakashima',
		miho_iwasaki: 'Miho Iwasaki',
		yumiko_inenaga: 'Yumiko Inenaga',
		ayumi_kojima: 'Ayumi Kojima',
		marina_masuda: 'Marina Masuda',
		alpha_wang: 'Alpha Wang',
		eric_st_louis: 'Eric St-Louis',
		christophe_mathon: 'Christophe Mathon',
		maria_castellanos: 'Maria Castellanos',
		quentin_coupey: 'Quentin Coupey',
		donny_chuc: 'Donny Chuc',
		ozaki_tatsuru: 'Ozaki Tatsuru',
		paul_michael_barraza: 'Paul-Michael Barraza',
		miyake_shinsuke: 'Miyake Shinsuke',
		midori_miyake: 'Midori Miyake',
		kobayashi_kazuhito: 'Kobayashi Kazuhito',
		vincent_leoquet: 'Vincent Leoquet',
		anna_fujimori: 'Anna Fujimori',
		chloe_depigny: 'Chloe Depigny',
		alban_billerey: 'Alban Billerey',
		pierre_charassier: 'Pierre Charassier',
		julien_cocault: 'Julien Cocault',
		jade_cocault: 'Jade Cocault',
		hisako_shimizu: 'Hisako Shimizu',
		junichi_shimizu: 'Junichi Shimizu',
		jose_ferreira: 'Jose Ferreira',
		hiroko_ferreira: 'Hiroko Ferreira',
		hara_mariko: 'Hara Mariko',
		hitachi_yukihiro: 'Hitachi Yukihiro',
		senoo_seiko: 'Senoo Seiko',
		noda_hidetoshi: 'Noda Hidetoshi',
		tobias_krueger: 'Tobias Krueger',
		atsuko_krueger: 'Atsuko Krueger',
		mizue_takeuchi: 'Mizue Takeuchi',
		yachiyo_kato: 'Yachiyo Kato',
		tomoko_yoshino: 'Tomoko Yoshino',
		sato_misaki: 'Sato Misaki',
		chiba_yuji: 'Chiba Yuji',
		kojima_satomi: 'Kojima Satomi',
		chika_yamaguchi: 'Chika Yamaguchi',
		eric_gibault: 'Eric Gibault',
		sekine_makiko: 'Sekine Makiko',
		sayuri_ishii: 'Sayuri Ishii',
		kabashima_seiichiro: '椛島 誠一郎',
		kabashima_erika: '椛島 恵里香',
		takahashi_leona: 'Takahashi Leona',
		todani_hitomi: 'Todani Hitomi'
		}
    end
end
