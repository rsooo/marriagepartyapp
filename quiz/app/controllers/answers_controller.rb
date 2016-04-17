class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_namehash

  helper_method :calcScore
  @test = {}

  def comingsoon
	render :html => "<H1>Coming Soon!!</H1>"
  end

  def q2
  end

  def q10
  end

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  def top
#	render :html => "<H1>Top Page</H1>"
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  def checkanswer
    @answers = []
    @rightanswer = [2,3,3,2,4,  4,1,4,1,1]
    namelist = {}
    @allanswers = Answer.all.order("created_at DESC")
    @allanswers.each{|ans|
	if !namelist.key?(ans.name)
		@answers << ans
		namelist[ans.name] = true
	end
    }
    @answers.sort!{|a,b| 
	if calcScore(b) == calcScore(a)
		a.created_at <=> b.created_at	
        else
		calcScore(b) <=> calcScore(a)
	end
    }

  end

  def newentry
    name = params[:name]
    @answer = Answer.new
    if @namehash.key?(name.to_sym)
	@answer.name = @namehash[name.to_sym]
    else
	@answer.name = name + '(unregistered)'
    end
  end

  def newentries
	rendar :text => "test test"
  end

  # GET /answers/1/edit
  def edit
  end

  def register

  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to action: "register", notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        #format.html { redirect_to action: "newentry", notice: '.' }
	flash.now[:error] = "submit is unsuccessful."
        format.html { render :newentry }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def calcScore(answer)
#	[1..10].each{|i|
#		isCollect()
#	}
	(1..10).inject(0){|sum,i| sum + isCollect(i, answer)}
	#(1..10).inject(0){|sum,i| sum + 1}
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:name, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :comment)
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
                kojima_satomi: 'Kojima_Satomi',
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

   def isCollect(num, answer)
	case num
	when 1 then
		answer.q1.to_i == @rightanswer[1 - 1] ? 1 : 0
	when 2 then
		answer.q2.to_i == @rightanswer[2 - 1] ? 1 : 0
	when 3 then
		answer.q3.to_i == @rightanswer[3 - 1] ? 1 : 0
	when 4 then
		answer.q4.to_i == @rightanswer[4 - 1] ? 1 : 0
	when 5 then
		answer.q5.to_i == @rightanswer[5 - 1] ? 1 : 0
	when 6 then
		answer.q6.to_i == @rightanswer[6 - 1] ? 1 : 0
	when 7 then
		answer.q7.to_i == @rightanswer[7 - 1] ? 1 : 0
	when 8 then
		answer.q8.to_i == @rightanswer[8 - 1] ? 1 : 0
	when 9 then
		answer.q9.to_i == @rightanswer[9 - 1] ? 1 : 0
	when 10 then
		answer.q10.to_i == @rightanswer[10 - 1] ? 1 : 0
        else
 
  	end
   end
end
