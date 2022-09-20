package com.ac.model;

import java.util.List;

import org.hibernate.Transaction;


public class AcDAOImpl implements AcDAO {
	
//	private Session getSession() {
//		return HibernateUtil.getSessionFactory().getCurrentSession();
//	}

	
	@Override
	public Integer insert(AcVO acVo) {
//		Transaction transaction = getSession().beginTransaction();
		acVo.setAc_update(0);
        getSession().save(acVo);
//        transaction.commit();
		return acVo.getAc_no();
	}

	@Override
	public Integer update(AcVO acVo) {
//		Transaction transaction = getSession().beginTransaction();
		AcVO ac = getSession().load(AcVO.class, acVo.getAc_no());
		ac.setAc_title(acVo.getAc_title());
		ac.setAc_content(acVo.getAc_content());
		ac.setAc_time(acVo.getAc_time());
		ac.setAc_type_no(acVo.getAc_type_no());
		getSession().update(ac);
//		transaction.commit();
		return 1;
	}

	@Override
	public AcVO getOneById(Integer id) {
//		Transaction transaction = getSession().beginTransaction();
		return getSession().get(AcVO.class, id);
//		transaction.commit();
//		return getOne;
	}

	@Override
	public List<AcVO> getAll() {
		final String hql = "FROM AcVO";
//		Transaction transaction = getSession().beginTransaction();
		return getSession().createQuery(hql, AcVO.class).list();
//		transaction.commit();
	}


}
