package com.commit451.gitlab.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;

import com.commit451.gitlab.R;
import com.commit451.gitlab.viewHolder.IssueLabelViewHolder;

import java.util.ArrayList;
import java.util.Collection;

/**
 * So many labels
 */
public class IssueLabelsAdapter extends RecyclerView.Adapter<IssueLabelViewHolder> {

    public interface Listener {
        void onLabelClicked(String label, IssueLabelViewHolder viewHolder);
    }
    private Listener mListener;

    private ArrayList<String> mValues;

    public IssueLabelsAdapter(Listener listener) {
        mListener = listener;
        mValues = new ArrayList<>();
    }

    private final View.OnClickListener mOnItemClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int position = (int) v.getTag(R.id.list_position);
            IssueLabelViewHolder holder = (IssueLabelViewHolder) v.getTag(R.id.list_view_holder);
            mListener.onLabelClicked(getEntry(position), holder);
        }
    };

    public void setLabels(Collection<String> labels) {
        mValues.clear();
        addLabels(labels);
    }

    public void addLabels(Collection<String> labels) {
        if (labels != null) {
            mValues.addAll(labels);
        }
        notifyDataSetChanged();
    }

    @Override
    public IssueLabelViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        IssueLabelViewHolder holder = IssueLabelViewHolder.inflate(parent);
        holder.itemView.setOnClickListener(mOnItemClickListener);
        return holder;
    }

    @Override
    public void onBindViewHolder(final IssueLabelViewHolder holder, int position) {
        holder.itemView.setTag(R.id.list_position, position);
        holder.itemView.setTag(R.id.list_view_holder, holder);
        holder.bind(getEntry(position));
    }

    @Override
    public int getItemCount() {
        return mValues.size();
    }

    private String getEntry(int position) {
        return mValues.get(position);
    }
}
