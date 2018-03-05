CREATE OR REPLACE FUNCTION Insert_Ligne(
     p_fac_id  in facture.fac_id  %type,
     p_art_nom in article.art_nom %type,
	 p_lig_nom in ligne.lig_nom   %type,
	 p_lig_qte in ligne.lig_qte   %type
     ) return number
IS
  v_art_id article.art_id %type;
  v_lig_id ligne.lig_id   %type;
  v_fac_id facture.fac_id %type;
  v_retour number := 0;
BEGIN
  select art_id 
  into   v_art_id
  from   article
  where  art_nom = p_art_nom
  ;
  if p_fac_id is null then
     v_fac_id := seq_fac_id.nextval;
	 insert into facture (fac_id, fac_date, fac_nom)
	 values
	 (v_fac_id, sysdate, 'Facture générique ' || trunc(sysdate))
	 ;
  else
     v_fac_id := p_fac_id;  
  end if;
  select nvl(max(lig_id),0) + 1
  into   v_lig_id
  from   ligne
  where  fac_id = v_fac_id
  ;
  insert into ligne(fac_id, lig_id, lig_nom, lig_qte, art_id)
  values
  (v_fac_id, v_lig_id, p_lig_nom, p_lig_qte, v_art_id)
  ;
  return v_retour;
END Insert_Ligne;
/
show err