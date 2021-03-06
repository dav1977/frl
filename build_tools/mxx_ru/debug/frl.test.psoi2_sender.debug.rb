require 'mxx_ru/cpp'
require 'ftools'

MxxRu::Cpp::exe_target("frl.test.psoi2_sender.debug.rb")\
{
	required_prj( "frl.lib.debug.rb" )
	target("test_psoi2_sender_d")
	include_path("../../../test/psoi2_sender")
	runtime_mode( MxxRu::Cpp::RUNTIME_DEBUG )
	rtl_mode( MxxRu::Cpp::RTL_STATIC )
	threading_mode( MxxRu::Cpp::THREADING_MULTI )
	obj_placement( MxxRu::Cpp::CustomSubdirObjPlacement.new( "../../../output/test/psoi2_sender",\
	"../../../output/test/psoi2_sender/obj/#{mxx_runtime_mode}/1/2/3" ) )
	cpp_sources Dir.glob( "../../../test/psoi2_sender/**/*.cpp" )
}
File.copy '../../../test/psoi2_sender/config.xml','../../../output/test/psoi2_sender/config.xml'
