# 依据目录下的contents.xml创建

#!/bin/bash
if [ -z "$1" ]; then
    echo "Parameter is null. Using default path: ./debug_files"
    dest_path="./debug_files"
else
    dest_path="$1/debug_files"
fi

mkdir -p "${dest_path}"
echo "Outputting .elf files to ${dest_path}"


copy_elf_files() {
    local elf_name="$1"
    local elf_path="$2"
    find "${elf_path}" -type f -name "${elf_name}" -exec cp -fu {} "${dest_path}" \;
}

# 指定 ELF 文件和路径
copy_elf_files "abl.elf" "./LINUX/android/out/target/product/monaco_go/"
copy_elf_files "a702_zap.elf" "./LINUX/android/out/target/product/monaco_go/vendor/firmware/"
copy_elf_files "scuba_ipa_fws.elf" "./LINUX/android/out/target/product/monaco_go/vendor/firmware/"
copy_elf_files "RPM_AAAAANAZR.elf" "./rpm_proc/core/bsp/rpm/build/atherton/sdm_ddr4"
copy_elf_files "xbl.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "imagefv.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "xbl_config.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "prog_firehose_ddr.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "prog_firehose_lite.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "JtagProgrammer.elf" "./boot_images/QcomPkg/SocPkg/AthertonPkg/Bin/LAA/RELEASE/"
copy_elf_files "WLAN_MERGED.elf" "./wlan_proc/build/ms/"
copy_elf_files "qupv3fw.elf" "./common/core_qupv3fw/atherton/"
#copy_elf_files "vmlinux" "./LINUX/android/out/target/product/monaco_go/obj/KERNEL_OBJ/"
#copy_elf_files "vmlinux" "./LINUX/android/out/target/product/monaco_go/secondary-boot/"

cp ./about.html -t ${dest_path}

# 添加更多的 ELF 文件和路径
# copy_elf_files "example.elf" "./path/to/example_directory/"




# # wlan host debug symbols
# elf_name='qca_cld3_qca6490.ko.unstripped'
# elf_path=./sxr2130_apps/LINUX/android/out/target/product/kona/obj/vendor/qcom/opensource/wlan/qcacld-3.0/.qca6490/
# cp -rf $(find ${elf_path} -type f -name ${elf_name}) -t ${dest_path}


# # wlan firmware debug symbols
# elf_name='CORE_ROM_V1_LINK_PATCHED_6490.wlanfw.evalQ_link.elf'
# elf_path=./sxr2130_wlan_hsp/wlan_proc/core/rombin/v1/core_rom_v1_link_patched/build/6490.wlanfw.eval/
# cp -rf $(find ${elf_path} -type f -name ${elf_name}) -t ${dest_path}

# elf_name='CNSS_RAM_V1_TO_LINK_PATCHED_6490.wlanfw.eval_v1_TO_xrQ_link.elf'
# elf_path=./sxr2130_wlan_hsp/wlan_proc/config/bsp/cnss_ram_v1_TO_link_patched/build/6490.wlanfw.eval_v1_TO_xr/
# cp -rf $(find ${elf_path} -type f -name ${elf_name}) -t ${dest_path}

# elf_name='msg_hash.txt'
# elf_path=./sxr2130_wlan_hsp/wlan_proc/scripts/myps/qshrink/
# cp -rf $(find ${elf_path} -type f -name ${elf_name}) -t ${dest_path}
