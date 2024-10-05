MACRO overworld_sprite
; pointer, bank, type, palette
	dab \1
	db ((\2 - 1) << 6) | \3
ENDM

SpriteHeaders:
; entries correspond to SPRITE_* constants
	table_width SPRITEDATA_LENGTH, SpriteHeaders
	overworld_sprite ChrisSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ChrisBikeSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ChrisSurfSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite KrisSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KrisBikeSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KrisSurfSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MomSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DadSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite LyraSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RivalSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FalknerSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BugsySpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite WhitneySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MortySpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ChuckSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite JasmineSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PryceSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ClairSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite WillSpriteGFX, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite KogaSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite BrunoSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite KarenSpriteGFX, STANDING_SPRITE, PAL_OW_AZURE
	overworld_sprite LanceSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BrockSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MistySpriteGFX, WALKING_SPRITE, PAL_OW_ORANGE
	overworld_sprite SurgeSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ErikaSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite JanineSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite SabrinaSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlaineSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BlueSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite RedSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite LeafSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite YellowSpriteGFX, WALKING_SPRITE, PAL_OW_ORANGE
	overworld_sprite OakSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ElmSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite IvySpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite WestwoodSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite WillowSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite AndySpriteGFX, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite BillSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite EusineSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite KurtSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RedsMomSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DaisySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite LoreleiSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite AgathaSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PalmerSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite WalkerSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ImakuniSpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite LawrenceSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite JamesSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JessieSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ProtonSpriteGFX, WALKING_SPRITE, PAL_OW_TEAL
	overworld_sprite PetrelSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite ArcherSpriteGFX, STANDING_SPRITE, PAL_OW_AZURE
	overworld_sprite ArianaSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite GiovanniSpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite CherylSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite RileySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BuckSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MarleySpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite MiraSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite AnabelSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite FlannerySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MayleneSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MarlonSpriteGFX, WALKING_SPRITE, PAL_OW_MARLON
	overworld_sprite ValerieSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite KukuiSpriteGFX, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite CaitlinSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite DarachSpriteGFX, WALKING_SPRITE, PAL_OW_GRAY
	overworld_sprite StevenSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite CynthiaSpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite CandelaSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlancheSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SparkSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BuenaSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CaptainSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite MatsumotoSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite AceTrainerFSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite AceTrainerMSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite AromaLadySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ArtistSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BakerSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BattleGirlSpriteGFX, WALKING_SPRITE, PAL_OW_AZURE
	overworld_sprite BeautySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BikerSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BirdKeeperSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BlackBeltSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BoarderSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BreederSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite BugCatcherSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BugManiacSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BurglarSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite CamperSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite ChildSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite CoolDudeSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CosplayerSpriteGFX, WALKING_SPRITE, PAL_OW_ORANGE
	overworld_sprite CowgirlSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite CuteGirlSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DragonTamerSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite ElderSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite EngineerSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FatGuySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite FirebreatherSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FisherSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite GentlemanSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite GrampsSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrannySpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite HexManiacSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite HikerSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JugglerSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KimonoGirlSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite LadySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite LassSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MatronSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite NurseSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite OfficerSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite OfficerFSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PharmacistSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PISpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite PicnickerSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PokefanMSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PokefanFSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite PokemaniacSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite PsychicSpriteGFX, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite RichBoySpriteGFX, WALKING_SPRITE, PAL_OW_GRAY
	overworld_sprite RockerSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RocketSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RocketGirlSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RoughneckSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SageSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SailorSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SchoolboySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SchoolgirlSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ScientistSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ScientistFSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SightseerMSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SkierSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SuperNerdSpriteGFX, WALKING_SPRITE, PAL_OW_GRAY
	overworld_sprite SwimmerGirlSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite SwimmerGuySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite TamerSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite TeacherSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite TwinSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite VeteranMSpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite VeteranFSpriteGFX, WALKING_SPRITE, PAL_OW_BLACK
	overworld_sprite WaitressSpriteGFX, WALKING_SPRITE, PAL_OW_AZURE
	overworld_sprite YoungsterSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BowingNurseSpriteGFX, STANDING_SPRITE, PAL_OW_PINK
	overworld_sprite ClerkSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite ReceptionistSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite LinkReceptionistSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite GymGuySpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite FishingGuruSpriteGFX, WALKING_SPRITE, PAL_OW_AZURE
	overworld_sprite GameboyKidSpriteGFX, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite GamerGirlSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite SilphEmployeeSpriteGFX, STANDING_SPRITE, PAL_OW_GRAY
	overworld_sprite SafariOfficerSpriteGFX, STANDING_SPRITE, PAL_OW_GRAY
	overworld_sprite SwimmingOfficerSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite SwimmingOfficerFSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite ClefairyWalkSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite FarfetchDSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite LaprasSpriteGFX, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite EeveeSpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite DragoniteSpriteGFX, WALKING_SPRITE, PAL_OW_ORANGE
	overworld_sprite MewSpriteGFX, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite CelebiSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite SurfingPikachuSpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ArmoredMewtwoSpriteGFX, WALKING_SPRITE, PAL_OW_GRAY
	overworld_sprite BigSnorlaxSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigLaprasSpriteGFX, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigOnixSpriteGFX, STANDING_SPRITE, PAL_OW_GRAY
	overworld_sprite BigGyaradosSpriteGFX, BIG_GYARADOS_SPRITE, PAL_OW_RED
	overworld_sprite PidgeottoSideSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite RattataBackSpriteGFX, STANDING_SPRITE, PAL_OW_PURPLE
	overworld_sprite SlowpoketailSpriteGFX, STANDING_SPRITE, PAL_OW_PINK
	overworld_sprite WeirdTreeSpriteGFX, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite BallCutFruitSpriteGFX, STANDING_SPRITE, PAL_OW_COPY_BG_GREEN
	overworld_sprite BoulderRockFossilSpriteGFX, STANDING_SPRITE, PAL_OW_COPY_BG_BROWN
	overworld_sprite BookPaperPokedexSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite SnesSpriteGFX, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite N64SpriteGFX, STANDING_SPRITE, PAL_OW_GRAY
	overworld_sprite SuspiciousManSpriteGFX, STANDING_SPRITE, PAL_OW_PURPLE
	overworld_sprite WiiSpriteGFX, STANDING_SPRITE, PAL_OW_AZURE
	overworld_sprite SilverTrophySpriteGFX, STANDING_SPRITE, PAL_OW_WHITE
	overworld_sprite GoldTrophySpriteGFX, STANDING_SPRITE, PAL_OW_YELLOW
	overworld_sprite ElectricFenceLeftSpriteGFX, STANDING_SPRITE, PAL_OW_ELECTRIC_FENCE
	overworld_sprite ElectricFenceRightSpriteGFX, STANDING_SPRITE, PAL_OW_ELECTRIC_FENCE
	overworld_sprite SailboatSpriteGFX, STANDING_SPRITE, PAL_OW_SAILBOAT
	overworld_sprite IceBoulderSpriteGFX, STANDING_SPRITE, PAL_OW_COPY_BG_BROWN
	overworld_sprite BeachGuySpriteGFX, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BeachGirlSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PiersSpriteGFX, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite KatySpriteGFX, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite AlolanExeggutorSpriteGFX, BIG_GYARADOS_SPRITE, PAL_OW_BROWN
	overworld_sprite SoldierSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite CrysSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite CrysBikeSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite CrysSurfSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite ThortonSpriteGFX, WALKING_SPRITE, PAL_OW_GREEN
	assert_table_length NUM_OVERWORLD_SPRITES
