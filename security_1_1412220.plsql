-- HASH
create or replace function Hash_data(p_key IN VARCHAR2)
return RAW DETERMINISTIC
IS
v_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
l_HASH raw(1024);
BEGIN
	l_HASH := dbms_crypto.hash(
			 src => v_key,
			 typ => dbms_crypto.HASH_SH1);
	return l_HASH;
END Hash_data;
/

-- encypt
create or replace function encrypt_data_luong(
	p_data IN VARCHAR2,
	v_keysx IN VARCHAR2)
return RAW DETERMINISTIC
IS
v_key RAW(128) := UTL_RAW.cast_to_raw(v_keysx);
l_data raw(1024) := utl_raw.cast_to_raw(p_data);
l_encrypted raw(1024);
BEGIN
	l_encrypted := dbms_crypto.encrypt(
		src => l_data,
		typ => dbms_crypto.DES_CBC_PKCS5,
		key => v_key);
	return l_encrypted;
END encrypt_data_luong;
/

--- decypt
create or replace function decrypt_data_luong(
	p_data IN VARCHAR2,
	p_hash_data in VARCHAR2,
	v_keysx IN VARCHAR2)
return VARCHAR2 DETERMINISTIC
IS
v_key RAW(128) := UTL_RAW.cast_to_raw(v_keysx);
l_decrypted raw(1024);
l_HASH raw(1024);
BEGIN
	l_HASH := dbms_crypto.hash(
			 src => v_key,
			 typ => dbms_crypto.HASH_SH1);

	if (l_HASH = p_hash_data)  then
	l_decrypted := dbms_crypto.decrypt(
		src => p_data,
		typ => dbms_crypto.DES_CBC_PKCS5,
		key => v_key);
	return utl_raw.cast_to_varchar2(l_decrypted);

	else
		return TO_CHAR(p_data);
	end if;

END decrypt_data_luong;
/

update nhanvien set hashkey = Hash_data('passwordexesx10') where manv = 'NV001';
update nhanvien set hashkey = Hash_data('passwordexesx20') where manv = 'NV002';
update nhanvien set hashkey = Hash_data('passwordexesx30') where manv = 'NV003';
update nhanvien set hashkey = Hash_data('passwordexesx40') where manv = 'NV004';
update nhanvien set hashkey = Hash_data('passwordexesx50') where manv = 'NV005';
update nhanvien set hashkey = Hash_data('passwordexesx60') where manv = 'NV006';
update nhanvien set hashkey = Hash_data('passwordexesx70') where manv = 'NV007';
update nhanvien set hashkey = Hash_data('passwordexesx80') where manv = 'NV008';
update nhanvien set hashkey = Hash_data('passwordexesx90') where manv = 'NV009';
update nhanvien set hashkey = Hash_data('passwordexesx100') where manv = 'NV010';
update nhanvien set hashkey = Hash_data('passwordexesx101') where manv = 'NV011';
update nhanvien set hashkey = Hash_data('passwordexesx102') where manv = 'NV012';
update nhanvien set hashkey = Hash_data('passwordexesx103') where manv = 'NV013';
update nhanvien set hashkey = Hash_data('passwordexesx104') where manv = 'NV014';
update nhanvien set hashkey = Hash_data('passwordexesx105') where manv = 'NV015';
update nhanvien set hashkey = Hash_data('passwordexesx106') where manv = 'NV016';
update nhanvien set hashkey = Hash_data('passwordexesx107') where manv = 'NV017';
update nhanvien set hashkey = Hash_data('passwordexesx108') where manv = 'NV018';
update nhanvien set hashkey = Hash_data('passwordexesx109') where manv = 'NV019';
update nhanvien set hashkey = Hash_data('passwordexesx110') where manv = 'NV020';

update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx10') where manv = 'NV001';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx20') where manv = 'NV002';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx30') where manv = 'NV003';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx40') where manv = 'NV004';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx50') where manv = 'NV005';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx60') where manv = 'NV006';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx70') where manv = 'NV007';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx80') where manv = 'NV008';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx90') where manv = 'NV009';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx100') where manv = 'NV010';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx101') where manv = 'NV011';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx102') where manv = 'NV012';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx103') where manv = 'NV013';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx104') where manv = 'NV014';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx105') where manv = 'NV015';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx106') where manv = 'NV016';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx107') where manv = 'NV017';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx108') where manv = 'NV018';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx109') where manv = 'NV019';
update nhanvien set luong = encrypt_data_luong(luong, 'passwordexesx110') where manv = 'NV020';

create procedure nhanvienLuong (key in varchar2 ,prc out sys_refcursor)
is
begin
  open prc for
	select manv, decrypt_data_luong(luong, hashkey, key) as LUONG from nhanvien;
end;

grant execute on nhanvienLuong to nhanvien;