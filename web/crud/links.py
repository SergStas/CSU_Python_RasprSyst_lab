from sqlalchemy.orm import Session

from core.db.models import Link
from typing import List


def create_link(db: Session, url: str) -> Link:
    link_db = Link(url=url)
    db.add(link_db)
    db.commit()
    return link_db


def get_link_by_id(db: Session, id: int) -> Link:
    link_db: Link = db.query(Link)\
        .filter(Link.id == id)\
        .one_or_none()
    return link_db


def get_link(db: Session) -> List[Link]:
    links_db: List[Link] = db.query(Link).all()
    return links_db


def update_status_by_id(db: Session, id: int, status: str) -> Link:
    link_db: Link = db.query(Link) \
        .filter(Link.id == id) \
        .one_or_none()
    if link_db is None:
        return None
    link_db.status = status
    db.commit()
    return link_db
